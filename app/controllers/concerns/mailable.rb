module Mailable
  extend ActiveSupport::Concern
  require 'sendgrid-ruby'
  include SendGrid

  def notify_shopper(answer_data)
    shop = ShopifyAPI::Shop.current
    product = ShopifyAPI::Product.find(answer_data[:question].product_id.to_i)
    from = Email.new(email: shop.email)
    subject = 'Answer from ' + shop.name
    to = Email.new(email: answer_data[:question].customer_email)
    to_jase = Email.new(email: "tinnguyen911@gmail.com")

    content = Content.new(type: 'text/html', value: mail_content(answer_data, shop, product))
    mail = Mail.new(from, subject, to, content)
    mail_to_jase = Mail.new(from, subject, to_jase, content)

    #sg = SendGrid::API.new(
    #  api_key: '',
    #  host: 'https://api.sendgrid.com')

    response = sg.client.mail._('send').post(request_body: mail.to_json)
    response_to_jase = sg.client.mail._('send').post(request_body: mail_to_jase.to_json)
  end

  def mail_content(answer_data, shop, product)
    styles = ".ExternalClass,.ExternalClass div,.ExternalClass font,.ExternalClass p,.ExternalClass span,.ExternalClass td,img{line-height:100%}#outlook a,body{padding:0}.appleBody a,.appleFooter"+

     "a,img{text-decoration:none}.ExternalClass,.ReadMsgBody{width:100%}a,body,table,td{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}table,td{mso-table-lspace:0;mso-table-rspace:0}img{-ms-interpolation-mode:bicubic;border:0;height:auto;outline:0}table{border-collapse:collapse!important}body{height:100%!important;margin:0;width:100%!important}.appleBody a{color:#68440a}.appleFooter a{color:#999}@media screen and"+

    "(max-width:525px){table[class=wrapper],table[class=responsive-table]{width:100%!important}td[class=logo]{text-align:left;padding:20px 0!important}td[class=logo] img{margin:0 auto!important}td[class=mobile-hide]{display:none}img[class=mobile-hide]{display:none!important}img[class=img-max]{max-width:100%!important;height:auto!important}td[class=mobile-wrapper],td[class=padding]{padding:10px 5% 15px!important}td[class=padding-copy]{padding:10px" +

     "5%!important;text-align:center}td[class=padding-meta]{padding:30px 5% 0!important;text-align:center}td[class=no-pad]{padding:0 0 20px!important}td[class=no-padding]{padding:0!important}td[class=section-padding]{padding:50px 15px!important}td[class=section-padding-bottom-image]{padding:50px 15px 0!important}table[class=mobile-button-container]{margin:0 auto;width:100%!important}a[class=mobile-button]{width:80%!important;padding:15px!important;border:0!important;font-size:16px!important}}"

    html =
      "<html>" +


      "<body style='margin: 0; padding: 0;'>" +
      "<style type='text/css'>#{styles}" +
      "</style>"+
      "<table border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;'> <tr> <td bgcolor='#f8f8f8' align='center' style='padding: 70px 15px 70px 15px;' class='section-padding'> <table border='0' cellpadding='0' cellspacing='0' width='700' style='padding:0 0 20px 0; background-color: #fff;' class='responsive-table'> <tr> <td align='left' style='background-color: #EBEBEB; padding: 10px 50px 10px 80px; font-size: 20px; font-family: Helvetica, Arial, Verdana; font-weight: bold; color: #333333;' class='padding-copy' colspan='2'>A Reply to Your Question from #{shop.name} Shop</td></tr><tr> <td style='padding: 10px 0 0 0;' class='no-padding'> <table border='0' cellspacing='0' cellpadding='0' width='100%'> <tr style='background-color: #EBEBEB;'> <td align='left' style='padding: 20px 0 20px 25px; font-size: 14px; font-family: Trebuchet MS, Helvetica, sans-serif; font-weight: 600; color: #aaaaaa;' class='padding-meta'> <div style='background-color:#fff;margin-right: 20px'> <div style='color:#000;text-decoration:underline;padding: 5px 0px 5px 5px;'>Answer from shop owner:</div><div style='padding: 0px 0px 5px 20px; font-size: 22px; font-family: Helvetica, Arial, sans-serif; font-weight: normal; color: #333333;'> #{answer_data[:answer].content} </div></div></td></tr><tr> <td align='left' style='padding: 10px 0 5px 25px; font-size: 13px; font-family: Helvetica, Arial, sans-serif; font-weight: normal; color: #aaaaaa;' class='padding-meta'>Your question:</td></tr><tr> <td align='left' style='padding: 0 0 5px 35px; font-size: 22px; font-family: Helvetica, Arial, sans-serif; font-weight: normal; color: #333333;' class='padding-copy'>#{answer_data[:question].question_content}</td></tr><tr> <td align='left' style='padding: 10px 0 5px 25px; font-size: 13px; font-family: Helvetica, Arial, sans-serif; font-weight: normal; color: #aaaaaa;' class='padding-meta'>On Product:</td></tr><tr> <td align='left' style='padding: 0px 0px 0px 30px; font-size: 22px; font-family: Helvetica, Arial, sans-serif; font-weight: normal; color: #333333;' class='padding-copy'> <tr> <td style='padding: 0 0 30px 25px; font-size: 20px; font-family: Helvetica, Arial, sans-serif; font-weight: normal; color: #333333;'>#{product.title} <a href='https://#{shop.myshopify_domain}/products/#{product.handle}'><img style='width: 100px; height: 100px;' src=#{product.images.first.src}/></a> </td></tr></td></tr><tr style='background-color: #EBEBEB;'> <td align='left' style='padding: 20px 0 20px 25px;font-size: 14px;font-family: Trebuchet MS, Helvetica, sans-serif;font-weight: 600;color: #000;' class='padding-meta'> <div style='margin-right: 20px;'> **Please reply to this email for more questions on this product. </div></td></tr></table> </td></tr></table> </td></tr></table><table border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;'> <tr> <td bgcolor='#ffffff' align='center'> <table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'> <tr> <td style='padding: 20px 0px 20px 0px;'> <table width='500' border='0' cellspacing='0' cellpadding='0' align='center' class='responsive-table'> <tr> <td align='center' valign='middle' style='font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color:#666666;'> <span class='appleFooter' style='color:#666666;'>Powered By: <a href='https://apps.shopify.com/question-pop'>Question Pop</a></span><br></td></tr></table> </td></tr></table> </td></tr></table>"
    html.html_safe
  end
end
