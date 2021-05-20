namespace :send_invitation do
    desc "Send invitation to subject"
    task :send_invitation => :environment do
        Subject.find_each do |subject|
            if subject.invitation_send == false
                SubjectMailer.send_email(subject).deliver_now
                subject.update_attribute(:invitation_send, true)
            else
                puts "Good !! there no invitation"
            end
        end
    end
end