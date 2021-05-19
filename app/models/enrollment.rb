class Enrollment < ApplicationRecord
    belongs_to :study
    belongs_to :subject

    # after_save :audit_log
    after_save :audit
    # def audit_log
  	# Rails.logger.info "**************inside audit log************"
  	# AuditJob.perform_later self  #queue
    # end
    def audit
        Rails.logger.info "**************inside audit log************"
      study_name, subject_name = study.name, subject.name
      
      Rake::Task['hello:process'].invoke
  
        file = File.join(File.dirname(__FILE__), 'audit.txt')
        File.open(file, 'a') { |f| f.puts "A subject named #{subject_name} , enrolled to a Study named #{study_name} with priority 0" }
    end
  
    handle_asynchronously :audit, queue: :least_priority

end
