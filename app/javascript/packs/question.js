window.switchTab = function (el, url, current_tab) {
    var selectedEl;
    selectedEl = document.querySelector('button.Polaris-Tabs__Tab.Polaris-Tabs__Tab--selected');
    selectedEl.setAttribute('tabindex', '-1');
    selectedEl.setAttribute('class', 'Polaris-Tabs__Tab');
    el.setAttribute('class', 'Polaris-Tabs__Tab Polaris-Tabs__Tab--selected');
    el.setAttribute('tabindex', '0');
    window.location = url;
}


window.markAnswer = function (el, question_id, base_url) {
    var answerText, data, parentNode, stackAnsweredDiv, stackAnsweredSpan, url;
    ShopifyApp.Bar.loadingOn();
    parentNode = el.parentNode;
    stackAnsweredDiv = document.createElement('div');
    stackAnsweredDiv.setAttribute('class', 'Polaris-ResourceList__Badge');
    stackAnsweredSpan = document.createElement('span');
    stackAnsweredSpan.setAttribute('class', 'Polaris-Badge');
    answerText = document.createTextNode('answered');
    stackAnsweredSpan.appendChild(answerText);
    stackAnsweredDiv.appendChild(stackAnsweredSpan);
    data = {
        'id': question_id
    };
    url = base_url + '/answer_mark';
    ShopifyApp.Bar.loadingOn();
    $.ajax({
        url: url,
        data: data,
        type: 'POST',
        dataType: 'jsonp',
        statusCode: {
            0: function () {
            },
            204: function () {
                parentNode.replaceChild(stackAnsweredDiv, el);
                ShopifyApp.Bar.loadingOff();
            }
        }
    });
};

window.sendAnswer = function (el, question_id, base_url) {
    var content, data, url;
    ShopifyApp.Bar.loadingOn();
    $('#sendBtn').addClass('Polaris-Button--disabled');
    url = base_url + '/add_answer';
    content = document.querySelector('#answer_text').value;
    data = {
        'question_id': question_id,
        'content': content
    };
    $.ajax({
        url: url,
        data: data,
        type: 'POST',
        dataType: 'jsonp',
        statusCode: {
            0: function () {
            },
            204: function () {
                ShopifyApp.Bar.loadingOff();
                $('#sendBtn').removeClass('Polaris-Button--disabled');
                $('#answerBox').load('/reload_answers/' + question_id);
            }
        }
    });
};

window.showAnswerBox = function (el, question) {
    var answerBox, answerBtn, backBtn;
    answerBox = document.querySelector('#answerBox');
    backBtn = document.querySelector('#backBtn');
    answerBtn = document.querySelector("#answerBtn");
    answerBox.setAttribute('style', 'display: block;  max-width: 55%;');
    backBtn.setAttribute('style', 'display: block');
    answerBtn.setAttribute('style', 'display: none;');
};

window.backFromAnswer = function (el) {
    var answerBox, backBtn;
    answerBox = document.querySelector('#answerBox');
    backBtn = document.querySelector("#backBtn");
    answerBox.setAttribute('style', 'display: none;');
    backBtn.setAttribute('style', 'display: none;');
    answerBtn.setAttribute('style', 'display: block;');
};

jQuery(function () {
    return $('#answer_text').keyup(function (e) {
        if ($(this).val().length !== 0) {
            return $('#sendBtn').removeClass('Polaris-Button--disabled');
        } else {
            return $('#sendBtn').addClass('Polaris-Button--disabled');
        }
    });
});

