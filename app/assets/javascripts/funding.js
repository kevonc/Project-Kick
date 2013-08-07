expired = Project.find_all_by_expired(true)
expired.count
ids = []
expired.each do |project|
    ids.push(project.category_id)
end

uniqueids = ids.uniq
uniqueids.count

thisidprojects = Project.find_all_by_category_id(237)
overfunded = []
thisidprojects.each do |project|
    overfunded.push(project.overfunded)
end





# get all the projects from each category id