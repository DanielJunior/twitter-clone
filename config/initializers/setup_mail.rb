ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => 'cartaouff2all@gmail.com',
    :password             => 'salacomar',
    :authentication       => 'plain',
    :enable_starttls_auto => true
}