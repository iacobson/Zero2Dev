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


end
