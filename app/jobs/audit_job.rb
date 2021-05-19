class AuditJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
         
      Rails.logger.info "=====================>We have logged an enrollment  #{args} =====#{args.class}"
  
      enrollment = args[0] 
      study_name, subject_name = enrollment.study.name, enrollment.subject.name
  
        file = File.join(File.dirname(__FILE__), 'audit.txt')
      File.open(file, 'a') { |f| f.puts "A subject named #{subject_name} , enrolled to a Study named #{study_name}" }
  
     
    end
  end