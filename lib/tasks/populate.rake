task :populate_category_projects => :environment do
  desc "Populate Category by Total Projects Table"

  run = 0
  x_counter = 0
  y_counter = 0
  x_stop = 930
  y_stop = 226

  while run < 240
  x = 2 + (x_counter * 32)
  y = 2 + (y_counter * 32)
    populate = D3CategoryProject.create(x: x, y: y)
    y_counter += 1

    if y == y_stop
      x_counter += 1
      y_counter = 0
    end
    run += 1
  end
end






# x: 2 34 66
# x: 2 + (i * 32)
# x-counter = 0 (col)
# stop at 930

# y: 2 34 66
# y: 2 + (i * 32)
# y-counter = 0 (row)
# everytime reach 226,
  # then add y-counter by 1, reset y to 34