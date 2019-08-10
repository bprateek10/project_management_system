$(document).on 'turbolinks:load', ->
  $('.alert').fadeOut 7000
  $('#sidenavToggler').click (e) ->
    e.preventDefault()
    $('body').toggleClass 'sidenav-toggled'
    $('.navbar-sidenav .nav-link-collapse').addClass 'collapsed'
    $('.navbar-sidenav .sidenav-second-level, .navbar-sidenav .sidenav-third-level').removeClass 'show'
    return
  $('.form-control').on 'change', ->
    $(@closest('.form-group')).find('.server-validation').hide()
    return
  return
  
  $('.custom-select').select2 placeholder: 'Developer Name'
