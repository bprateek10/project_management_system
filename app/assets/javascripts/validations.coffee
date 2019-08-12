$(document).on 'turbolinks:load' ,->
  $('.login-form').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    rules:
      'user[email]': 
        required: true
        email: true
      'user[password]': required: true
    messages:
      'user[email]': 
        required: 'Please enter email'
        email: 'Please enter a valid email'
      'user[password]': required: 'Please enter the password'

  $('.project-validation').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    rules:
      'project[title]': required: true
    messages:
      'project[title]': required: 'Please enter the project name'

  $('.member-validation').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    errorPlacement: (error, element) ->
      error.insertAfter $('.developer-list-section').find('.select2-container')
    rules:
      'user_project[user_id]': required: true
    messages:
      'user_project[user_id]': required: 'Please select the developer'
  
  $('.todo-validation').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    errorPlacement: (error, element) ->
      if element[0].name == 'todo[user_id]'
        error.insertAfter $('.assignee-list-section').find('.select2-container')
      else
        error.insertAfter element
    rules:
      'todo[user_id]': required: true
      'todo[title]': required: true
    messages:
      'todo[user_id]': required: 'Please select assignee'
      'todo[title]': required: 'Please enter the todo title'

  $('.invitaion-validation').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    rules:
      'user[email]': 
        required: true
        email: true
    messages:
      'user[email]': 
        required: 'Please enter the email address'
        email: 'Please enter a valid email address'
  
  $('.invitation-acceptance-validation').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    rules:
      'user[first_name]': 
        required: true
      'user[last_name]': 
        required: true
      'user[password]':
        required: true
        minlength: 8
      'user[password_confirmation]':
        required: true
        equalTo: '#user-password'
    messages:
      'user[first_name]':
        required: 'Please enter your first name'
      'user[last_name]':
        required: 'Please enter your last name'
      'user[password]':
        required: 'Please enter your password name'
        minlength: 'Password should be of 8 characters'
      'user[password_confirmation]':
        required:'Please re-enter the password'
        equalTo: 'Password did not match'