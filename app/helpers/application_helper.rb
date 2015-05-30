module ApplicationHelper


  def set_name_link

    case controller_name
      when "resources"                                                            #TODO TO BE CUSTOMIZED !!!!
        {name1: "POST NEW LEARN RESOURCE", name2: "ASK QUESTION", link1: new_resource_path, link2: new_resource_path, col: 3}
      when "projects"
        {name1: "ADD NEW PROJECT", link1: new_project_path, col: 4}
      when "collaborations"
        {name1: "POST NEW REQUEST", link1: new_collaboration_path, col: 4}
      when "jobs"
        {name1: "POST JOBS INFO", name2: "ASK QUESTION", link1: new_job_path, link2: new_job_path, col: 3}
    end
  end

  # select all technologies tags for all Models
  def all_technologies_list
    ActsAsTaggableOn::Tagging.includes(:tag).where(context: 'technologies').map{|tagging| tagging.tag.name}.uniq
  end

  # select all technologies tags for each Model type, and maps them to array
  # request done with 'squeel' gem
  def all_technologies_list_for_type
    case controller_name
      when "resources"
        @model = "Resource"
      when "projects"
        @model = "Project"
      when "collaborations"
        @model = "Collaboration"
      when "jobs"
        @model = "Job"
    end
    #need local variable for squeel to work
    model = @model
    ActsAsTaggableOn::Tagging.includes(:tag).where{(taggable_type == model) & (context == 'technologies')}.map{|tagging| tagging.tag.name}.uniq
  end


end
