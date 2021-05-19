class ParticipantMailer < ApplicationMailer

    def success_email(participant)
       
        @participant = participant
        mail(to: @participant.email_address , subject: 'Study created successfully')
    end
end