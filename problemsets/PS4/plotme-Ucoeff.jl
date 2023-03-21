# inlclude the Submit.jl script 
include("Submit.jl");

# packages-
using PyPlot
using PyCall
using Colors
@pyimport matplotlib.patches as patches

# define my colors -
negative_color = (1/255)*[187,187,187]
positive_color = (1/255)*[0,119,187]
# negative_color = colorant"#BBBBBB"
# positive_color = colorant"#EE7733"


function calculate_mean_centered_array(data_array)

    # what is the dimension of the data array?
    (number_of_rows, number_of_cols) = size(data_array)

    # initialize -
    mean_centered_array = zeros(number_of_rows,1)

    # mean center each col -
    for col_index = 1:number_of_cols

        # grab a col from the sensitvity array -
        col_data = data_array[:,col_index]

        # mean center -
        μ = mean(col_data)
        centered_col = col_data .- μ

        # package -
        mean_centered_array = [mean_centered_array centered_col]
    end

    # cut off the leading col of zeros -
    mean_centered_array = mean_centered_array[:,2:end]
end

function calculated_scaled_data_array(data_array,a,b)

    # what is the size?
    (number_of_rows, number_of_cols) = size(data_array)

    # initialize -
    scaled_data_array = zeros(number_of_rows, number_of_cols)
    for col_index = 1:number_of_cols

        # find the min and max -
        min_value = minimum(data_array[:,col_index])
        max_value = maximum(data_array[:,col_index])


        for row_index = 1:number_of_rows

            old_value = data_array[row_index, col_index]

            if (min_value == 0.0 && max_value == 0.0)
                scaled_data_array[row_index, col_index] = 0.0
            else
                new_value = a + ((old_value - min_value)*(b - a))/(max_value - min_value)
                scaled_data_array[row_index, col_index] = new_value
            end
        end
    end


    # return -
    return scaled_data_array
end

function calculate_x_axis_tick_positions(data_array;box_width=1.0)

    # what is the size?
    (number_of_rows, number_of_cols) = size(data_array)

    # initialize -
    x_axis_points = Float64[]
    epsilon = 0.30;

    for col_index = 1:number_of_cols

        # compute origin point -
        origin_point = (col_index - 1)+(col_index - 1)*epsilon + 1
        push!(x_axis_points,origin_point+0.5*box_width)
    end

    return x_axis_points
end

function calculate_y_axis_tick_positions(data_array; box_height=1.0)

    # what is the size?
    (number_of_rows, number_of_cols) = size(data_array)

    # initialize -
    y_axis_points = Float64[]

    for col_index = 1:number_of_cols

        # get the data array -
        data_scaled = data_array[:,col_index]

        # how many patches per col?
        number_of_patches = length(data_scaled)
        epsilon = 0.5;
        for row_index = 1:number_of_patches

            # compute origin point -
            origin_point = [(col_index - 1)+(col_index - 1)*epsilon + 1,(row_index - 1)+(row_index - 1)*epsilon+1];

            push!(y_axis_points,origin_point[2]+0.5*box_height)
        end
    end

    return y_axis_points
end

function visualize(data_array,x_axis_ticks,y_axis_ticks,y_label_array,a,b)

    # what is the size?
    (number_of_rows, number_of_cols) = size(data_array)

    epsilon = 0.5;
    ax = gca()

    # set the axis tick postions -
    ax.set_xticks(x_axis_ticks)
    ax.set_yticks(y_axis_ticks)
    ax.set_yticklabels(y_label_array)
    subplots_adjust(left=0.25)

    # create x-label array -
    x_label_array = ["PC$(x)" for x=1:number_of_cols]
    ax.set_xticklabels(x_label_array, rotation=45)
    ax.spines["right"].set_visible(false)
    ax.spines["top"].set_visible(false)
    ax.spines["bottom"].set_visible(false)
    ax.spines["left"].set_visible(false)

    for col_index = 1:number_of_cols

        # get the data array -
        data_scaled = data_array[:,col_index]

        # how many patches per col?
        number_of_patches = length(data_scaled)
        for row_index = 1:number_of_patches

            # compute origin point -
            origin_point = [(col_index - 1)+(col_index - 1)*epsilon + 1,(row_index - 1)+(row_index - 1)*epsilon+1];

            # compute alpha -
            data_value = data_array[row_index, col_index]
            if (data_value == 0.0)

                # compute a new color -
                patch_face_color = (0.5)*(negative_color .+ positive_color)

                # draw the square -
                ax.add_patch(

                           patches.Rectangle(origin_point,   # (x,y)
                               1.0,          # width
                               1.0,          # height
                               facecolor=patch_face_color,
                               edgecolor="grey",
                               linewidth=0.5,
                           )
                       )

            else

                beta = (data_value - a)/(b - a)

                # compute a new color -
                patch_face_color = (1-beta)*negative_color .+ beta*positive_color

                # draw the square -
                ax.add_patch(

                           patches.Rectangle(origin_point,   # (x,y)
                               1.0,          # width
                               1.0,          # height
                               facecolor=patch_face_color,
                               edgecolor="grey",
                               linewidth=0.5,
                               alpha = 1 - ((col_index-1)/number_of_cols)^0.8
                           )
                       )
            end
        end
    end


    axis("square")
end

# load the sensitvity data -
data_array = abs.(F.U[:,1:2]);

# read my case labels -
case_labels_array = list_of_measurements;

# calculate the tick locations -
x_axis_points = calculate_x_axis_tick_positions(data_array)
y_axis_points = calculate_y_axis_tick_positions(data_array)

# mean center -
mean_centered_array = calculate_mean_centered_array(data_array)
scaled_data_array = calculated_scaled_data_array(mean_centered_array, 0, 1)
visualize(scaled_data_array, x_axis_points, y_axis_points, [case_labels_array ; case_labels_array], 0, 1)
