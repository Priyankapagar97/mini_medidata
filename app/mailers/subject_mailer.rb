class SubjectMailer < ApplicationMailer

    def send_email(subject)
       
        @subject = subject
        mail(to: @subject.email , subject: 'subject created successfully')
    end
end