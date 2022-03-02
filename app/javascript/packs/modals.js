window.alertModal = function(){
  ShopifyApp.Modal.alert('Message for an alert window.');
}

window.confirmModal = function () {
  ShopifyApp.Modal.confirm({
    title: "Are you sure you want to delete this?",
    message: "Do you want to delete your account? This can't be undone.",
    okButton: "Yes, delete it",
    cancelButton: "No, keep it",
    style: 'danger'
  }, function(result){
    if (result)
      ShopifyApp.flashNotice("Delete has been confirmed.")
    else
      ShopifyApp.flashNotice("Delete has been cancelled.")
  });
}

window.inputModal = function (prompt) {
  ShopifyApp.Modal.input(prompt, function(result, data){
    if(result){
      ShopifyApp.flashNotice("Received: \"" + data + "\"");
    }
    else{
      ShopifyApp.flashError("Input cancelled.");
    }
  });
}

window.newModal = function(base_url, question_id, current_tab){
  var path = base_url + "/questions/" + question_id;
  var answerMarkUrl = base_url + '/answer_mark';
  data = {'id': question_id};
  ShopifyApp.Modal.open({
    src: path,
    title: 'Question detail',
    height: 400,
    width: 'large',
    buttons: {

      secondary: {
        label: "Close",
        callback: function(message){
          window.location.reload(true);
          ShopifyApp.Modal.close("cancel");
        }
      }
    },
  }, function(result){
    if (result == "ok")
      ShopifyApp.flashNotice("'Ok' button pressed")
    else if (result == "cancel")
      return;
  });
}

window.settingModal = function(base_url, shop_domain){
  var path = base_url + "/settings?shop_domain=" + shop_domain;
  ShopifyApp.Modal.open({
    src: path,
    title: 'Popup Customization',
    height: 400,
    width: 'large',
    buttons: {
      primary: {
        label: "Save",
        message: 'unicorn_form_submit',
        callback: function(message){
          window.location.reload(true);
          ShopifyApp.Modal.close("ok");
        }
      },
      secondary: {
        label: "Close",
        callback: function(message){
          window.location.reload(true);
          ShopifyApp.Modal.close("cancel");
        }
      }
    },
  }, function(result){
    if (result == "ok")
      ShopifyApp.flashNotice("Setting were saved!")
    else if (result == "cancel")
      return;
  });
}

window.contactModal = function(base_url, shop_domain){
  var path = base_url + "/contact?shop_domain=" + shop_domain;
  ShopifyApp.Modal.open({
    src: path,
    title: 'Contact Us',
    height: 400,
    width: 'large',
    buttons: {
      primary: {
        label: "Send",
        message: 'unicorn_form_submit',
        callback: function(message){
          window.location.reload(true);
          ShopifyApp.Modal.close("ok");
        }
      },
      secondary: {
        label: "Close",
        callback: function(message){
          window.location.reload(true);
          ShopifyApp.Modal.close("cancel");
        }
      }
    },
  }, function(result){
    if (result == "ok")
      ShopifyApp.flashNotice("Thanks for contacting us. We will get back to your query.")
    else if (result == "cancel")
      return;
  });
}

window.newButtonModal = function(path, title){
  ShopifyApp.Modal.open({
    src: path,
    title: title,
    height: 400,
    width: 'large',
    buttons: {
      primary: {
        label: "Yes",
        callback: function(){ alert("'Yes' button clicked"); }
      },
      secondary: [
        {
          label: "Close",
          callback: function(message){ ShopifyApp.Modal.close("close"); }
        },
        {
          label: "Normal",
          callback: function(){ alert("'Normal' button clicked"); }
        }
      ],
      tertiary: [
        {
          label: "Danger",
          style: "danger",
          callback: function(){ alert("'Danger' button clicked"); }
        },
        {
          label: "Disabled",
          style: "disabled"
        }
      ]
    },
  }, function(result){
    if (result)
      ShopifyApp.flashNotice("'" + result + "' button pressed")
    else
      ShopifyApp.flashNotice("No result returned")
  });
}
