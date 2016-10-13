// app/assets/javascripts/channels/messages.js

App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden');
    //return $('#messages').append(this.renderMessage(data));
    $('#messages').append(this.renderMessage(data));
    return $('#messages').scrollTop($('#messages')[0].scrollHeight);
  },

  renderMessage: function(data) {
    $('input.form-control').val('');
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";

  }
});
