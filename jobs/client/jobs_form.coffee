Template.jobsForm.onRendered ->
  @$(".summernote").summernote
    type: 'summernote'
    height: 300
    minHeight: 300
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'italic', 'underline', 'clear']],
      ['para', ['ul', 'ol']],
      ['insert', ['link','hr']]
    ]
    styleWithSpan: false

Template.jobsForm.getData = (template) ->

  data = {}

  title = template.$("#title")
  if _.isEmpty title.val().trim()
    bootbox.alert "O título precisa ser preenchido!"
    title.closest(".form-group").addClass 'has-error'
    return false
  data.title = title.val().trim()

  term = template.$("#term")
  if _.isEmpty term.val().trim()
    bootbox.alert "O tipo precisa ser escolhido!"
    term.closest(".form-group").addClass 'has-error'
    return false
  data.term = term.val().trim()

  company = template.$("#company")
  if _.isEmpty company.val().trim()
    bootbox.alert "A empresa precisa ser preenchida!"
    company.closest(".form-group").addClass 'has-error'
    return false
  data.company = company.val().trim()

  email = template.$("#email")
  if _.isEmpty email.val().trim()
    bootbox.alert "O email precisa ser preenchida!"
    email.closest(".form-group").addClass 'has-error'
    return false
  unless (/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i).test email.val()
    bootbox.alert "Por favor, entre com um emai válido!"
    email.closest(".form-group").addClass 'has-error'
    return false
  data.email = email.val().trim()

  description = template.$("#description")
  if description.summernote('isEmpty')
    bootbox.alert "A descrição precisa ser preenchida!"
    description.closest(".form-group").addClass 'has-error'
    return false
  data.description = description.code()

  data

Template.jobsForm.helpers

  terms: ->
    ["Full Time", "Estágio", "Freela", "Por Hora", "Open Source", "Voluntário"]

Template.jobsForm.events

  'focus :input': (event, template) ->
    $(event.target).closest(".form-group").removeClass 'has-error'
