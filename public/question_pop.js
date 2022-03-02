(function(){

  var base_url = "https://questionpop.herokuapp.com";
  //var base_url = "https://5475e1e1.ngrok.io/";
  var shop_domain = Shopify.shop;
  var infoUrl = base_url + "/api/v1/info?shop_domain=" + shop_domain;

var loadScript = function(url, callback){
  // var script = document.createElement("script");
  // script.type = "text/javascript";
  //
  // If the browser is Internet Explorer.
  if (script.readyState){
    script.onreadystatechange = function(){
      if (script.readyState == "loaded" || script.readyState == "complete"){
        script.onreadystatechange = null;
        callback();
      }
    };
  // For any other browser.
  } else {
    script.onload = function(){
      callback();
    };
  }

  script.src = url;
  document.getElementsByTagName("head")[0].appendChild(script);

};

/* This is my app's JavaScript */
var questionPopApp = function($){
 var setting;

 var productInfoUrl = window.location.href;
 if (productInfoUrl.substr(productInfoUrl.length - 1) == "#") {
   productInfoUrl = productInfoUrl.substring(0, productInfoUrl.length - 1);
 }

 var productInfo;

 function getProductData(productInfoUrl, callback) {
    $.ajax({
      url: productInfoUrl + ".json",
      type: 'GET',
      contentType: "application/json",
      dataType: 'json',
      crossDomain: true,
      success: callback
    })
  }
  getProductData(productInfoUrl, function(response) {
    productId = response.product.id;
    getSettingData(infoUrl, function(response) {
      setting = response;
      buildPopupElements(setting, productId);
    });
  });


 function getSettingData(url, callback) {
    $.ajax({
      url: url,
      type: 'GET',
      dataType: "jsonp",
      crossDomain: true,
      success: callback
    })
  }


  function buildPopupElements(setting) {
    var questionLink = document.createElement('a');
    var questionDiv = document.createElement('div');

    if (document.querySelector("form[action='/cart/add']").querySelector('button[type="submit"]') == null) {
      var linkContainer = document.querySelector("form[action='/cart/add']").querySelector('input[type="submit"]').parentNode;
      var buttonContainer = document.querySelector("form[action='/cart/add']").querySelector('input[type="submit"]');
    } else {
      var linkContainer = document.querySelector("form[action='/cart/add']").querySelector('button[type="submit"]').parentNode;
      var buttonContainer = document.querySelector("form[action='/cart/add']").querySelector('button[type="submit"]');
    }

    var buttonContainerStyle = window.getComputedStyle ? getComputedStyle(buttonContainer, null) : buttonContainer.currentStyle;
    var buttonContainerWidth = buttonContainerStyle.width;
    questionLink.setAttribute('href', '#');
    questionLink.setAttribute('id', 'questionLink');

    questionLink.setAttribute('class', 'questionBtn btn2');
    questionDiv.setAttribute('style', 'margin-top: 3px; text-align: center; width: ' + buttonContainerWidth);

    if (Shopify.shop === 'comme-un-reve.myshopify.com') {
      var questionText = document.createTextNode("Je souhaite poser une question sur ce produit");
      questionLink.setAttribute('style', 'border: none; font-size: 14px; color: #6c3d19');
    } else if (Shopify.shop === 'shoppingdirect24.myshopify.com') {
      questionLink.setAttribute('style', 'font-size: 15px;');
      questionDiv.setAttribute('style', 'margin-top: 3px; text-align: center; width: 250px; text-align: center; padding-top: 10px;');
      var questionText = document.createTextNode("? Ask a Question");
    } else {
      var questionText = document.createTextNode("? Ask a Question");
    }

    if (Shopify.shop == 'jbads.myshopify.com') {
      questionLink.setAttribute('style', 'color: rgb(0, 110, 255)');
    }

    questionLink.appendChild(questionText);
    questionDiv.appendChild(questionLink);

    if (Shopify.shop === 'paper-lace-design.myshopify.com') {
      questionDiv.setAttribute('style', 'margin-left: 30px; margin-bottom: 80px;');
      document.getElementById("AddToCart").setAttribute('style', 'margin-bottom: 10px;');
      document.getElementById("AddToCart").parentNode.insertBefore(questionDiv, document.getElementById("AddToCart").nextSibling);
    } else {
      linkContainer.appendChild(questionDiv);
    }

    var popupQuestion = document.createElement('div');
    var questionForm = document.createElement('form');
    var popupQuestionContainer = document.createElement('div');
    var p = document.createElement('p');
    var a = document.createElement('a');
    var i = document.createElement('i');
    var nameDiv = document.createElement('div');
    var namelabel = document.createElement('label');
    var nameInput = document.createElement('input');
    var emailDiv = document.createElement('div');
    var emailLabel = document.createElement('label');
    var emailInput = document.createElement('input');
    var questionDiv = document.createElement('div');
    var questionLabel = document.createElement('label');
    var questionTextarea = document.createElement('textarea');
    var submitDiv = document.createElement('div');
    var submitP = document.createElement('p');
    var submitInput = document.createElement('input');
    var popupNotification = document.createElement('div');
    var popupNotificationContainer = document.createElement('div');
    var aNoficationClose = document.createElement('a');
    var iNotificationClose = document.createElement('i');
    var pNotification = document.createElement('p');
    var notificationTxt = document.createElement('h3');
    notificationTxt.setAttribute('id', 'notification-text');
    notificationTxt.innerHTML = "Thanks for contact us";
    iNotificationClose.setAttribute("class", "fa fa-times");
    iNotificationClose.setAttribute("style", "pointer-events:none;");
    aNoficationClose.setAttribute("href", "#");
    aNoficationClose.setAttribute("class", "popup-close close-button");
    popupNotificationContainer.setAttribute('class', 'popup-container');
    popupNotification.setAttribute('class', 'popup notification');
    popupNotification.setAttribute('role', 'alert');
    popupNotification.setAttribute('style', 'padding-top: 50px');
    popupNotification.setAttribute('hidden', 'true');
    pNotification.appendChild(notificationTxt);
    aNoficationClose.appendChild(iNotificationClose);
    popupNotificationContainer.appendChild(aNoficationClose);
    popupNotificationContainer.appendChild(pNotification);
    popupNotification.appendChild(popupNotificationContainer);
    i.setAttribute('class', 'fa fa-times');
    i.setAttribute('style', 'pointer-events:none;');
    a.setAttribute('href', '#');
    a.setAttribute('class', 'popup-close close-button');
    a.appendChild(i);
    p.appendChild(a);
    submitDiv.setAttribute('class', 'submit');
    submitP.setAttribute('class', 'user-message');
    submitP.setAttribute('id', 'contactblurb');
    submitP.innerHTML = setting.user_message;
    submitInput.setAttribute('type', 'submit');
    submitInput.setAttribute('name', 'submit');
    submitInput.setAttribute('id', 'submit');
    if (Shopify.shop === 'comme-un-reve.myshopify.com') {
      submitInput.setAttribute('value', 'Envoyé');
    } else {
      submitInput.setAttribute('value', 'Send');
    }
    submitDiv.appendChild(submitP);
    submitDiv.appendChild(submitInput);
    nameDiv.setAttribute('class', 'name');
    namelabel.setAttribute('for', 'Name');
    if (Shopify.shop === 'comme-un-reve.myshopify.com') {
      namelabel.innerHTML = 'Nom';
    } else {
      namelabel.innerHTML = 'Name';
    }
    nameInput.setAttribute('type', 'text');
    nameInput.setAttribute('id', 'name');
    nameInput.setAttribute('name', 'name');
    nameDiv.appendChild(namelabel);
    nameDiv.appendChild(nameInput);
    emailDiv.setAttribute('class', 'email');
    emailLabel.setAttribute('for', 'email');
    emailLabel.innerHTML = 'Email';
    emailInput.setAttribute('type', 'text');
    emailInput.setAttribute('id', 'email');
    emailInput.setAttribute('name', 'email');
    emailDiv.appendChild(emailLabel);
    emailDiv.appendChild(emailInput);
    questionDiv.setAttribute('class', 'question');
    questionLabel.setAttribute('for', 'question');
    if (Shopify.shop === 'comme-un-reve.myshopify.com') {
      questionLabel.innerHTML = 'Votre Question';
    } else {
      questionLabel.innerHTML = 'Question';
    }
    questionTextarea.setAttribute('id', 'question');
    questionTextarea.setAttribute('name', 'question');
    questionDiv.appendChild(questionLabel);
    questionDiv.appendChild(questionTextarea);
    popupQuestionContainer.appendChild(p);
    popupQuestionContainer.appendChild(nameDiv);
    popupQuestionContainer.appendChild(emailDiv);
    popupQuestionContainer.appendChild(questionDiv);
    popupQuestionContainer.appendChild(submitDiv);
    popupQuestion.setAttribute('class', 'popup question');
    popupQuestion.setAttribute('hidden', 'true');
    questionForm.setAttribute('class', 'question-form');
    questionForm.setAttribute('id', 'questionForm');
    questionForm.setAttribute('name', 'questionForm');
    //questionForm.setAttribute('method', 'post');
    //questionForm.setAttribute('action', 'https://2c2d4b26.ngrok.io/questions');
    popupQuestionContainer.setAttribute('class', 'popup-container');
    questionForm.appendChild(popupQuestionContainer);
    popupQuestion.appendChild(questionForm);

    if (document.getElementById('shopify-section-product-template') === undefined || document.getElementById('shopify-section-product-template') === null) {
      productTemplate = document.getElementsByTagName("main")[0].children[0];
    } else {
      productTemplate = document.getElementById('shopify-section-product-template');
    }
    productTemplate.appendChild(popupQuestion);
    productTemplate.appendChild(popupNotification);

    $('#questionLink').on('click', function(event) {
      $('.popup').removeAttr('hidden');
      $('.question').addClass('is-visible');
    });

    function validateEmail(email) {
      var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(email);
    }

    function closeForm() {
      document.questionForm.name.value = '';
      document.questionForm.email.value = '';
      document.questionForm.question.value = '';

      $('.email').removeClass('typing');
      $('.name').removeClass('typing');
      $('.question').removeClass('typing');

      $('.popup').removeClass('is-visible');
      $('.notification').addClass('is-visible');
      $('#notification-text').html(setting.notification_message);
    }

    $(document).ready(function($) {

      /* ------------------------- */
      /* Contact Form Interactions */
      /* ------------------------- */


      //close popup when clicking x or off popup
      $('.popup').on('click', function(event) {
        if ($(event.target).is('.popup-close') || $(event.target).is('.cd-popup')) {
          event.preventDefault();
          $(this).removeClass('is-visible');
        }
      });

      //close popup when clicking the esc keyboard button
      $(document).keyup(function(event) {
        if (event.which == '27') {
          $('.popup').removeClass('is-visible');
        }
      });

      /* ------------------- */
      /* Contact Form Labels */
      /* ------------------- */
      $('#name').keyup(function() {
        $('.name').addClass('typing');
        if ($(this).val().length == 0) {
          $('.name').removeClass('typing');
        }
      });
      $('#email').keyup(function() {
        $('.email').addClass('typing');
        if ($(this).val().length == 0) {
          $('.email').removeClass('typing');
        }
      });
      $('#message').keyup(function() {
        $('.message').addClass('typing');
        if ($(this).val().length == 0) {
          $('.message').removeClass('typing');
        }
      });

      document.getElementById("questionForm").onsubmit = function() {
        return false;
      };

      $('#questionForm').submit(function(e) {
        var name = $('#name').val();
        var email = $('#email').val();
        var product_id = productId;
        var customer_name = $("#name").val();
        var customer_email = $("#email").val();
        var question_content = $("#question").val();
        var data = {
          "shop_domain": shop_domain,
          "product_id": product_id,
          "customer_email": customer_email,
          "customer_name": customer_name,
          "question_content": question_content,
        };
        var url = base_url + "/questions";
        if (validateEmail(email)) {
          if (question_content != "") {
            if (name) {
              $.ajax({
                url: url,
                data: data,
                type: 'POST',
                crossDomain: true,
                dataType: 'json',
                statusCode: {
                  0: function() {
                  },
                  204: function() {
                  }
                }
              });
              closeForm();
            } else {
              $('.notification').removeAttr('hidden');
              $('#notification-text').html('<strong>Please provide a name.</strong>');
              $('.notification').addClass('is-visible');
            }
          } else {
            $('.notification').removeAttr('hidden');
            $('#notification-text').html('<strong>Please provide a question.</strong>');
            $('.notification').addClass('is-visible');
          }
        } else {
          $('#notification-text').html('<strong>Please use a valid email address.</strong>');
          $('.notification').addClass('is-visible');
        }
        //return false;
      });
    });
  }


};

if (window.location.href.indexOf('/products/') !== -1) {
  if ((typeof jQuery === 'undefined') || (parseFloat(jQuery.fn.jquery) < 1.7)) {
    loadScript('//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js', function(){
      jQuery191 = jQuery.noConflict(true);
      questionPopApp(jQuery191);
    });
  } else {
    questionPopApp(jQuery);
  }
}


var cssId = 'myCss';  // you could encode the css path itself to generate id..
var buttonCss = 'buttonCss';  // you could encode the css path itself to generate id..
if (!document.getElementById(cssId))
{
    var head  = document.getElementsByTagName('head')[0];
    var link1  = document.createElement('link');
    var link2  = document.createElement('link');
    link1.id   = cssId;
    link2.id   = buttonCss;
    link1.rel  = 'stylesheet';
    link2.rel  = 'stylesheet';
    link1.type = 'text/css';
    link2.type = 'text/css';
    link1.href = base_url + '/popup.css';
    link2.href = base_url + '/button.css';
    link1.media = 'all';
    link2.media = 'all';
    head.appendChild(link1);
    head.appendChild(link2);
}

})();
