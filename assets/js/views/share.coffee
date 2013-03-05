class TL.Views.Modals.Share extends Backbone.View
  className: 'share-form modal hide fade'
  events:
    'click button':'submit'
    'change input[name]':'setObject'
  
  initialize: ->
    _.bindAll(@)
    @model = new TL.Models.VideoObject()
    @render()
  
  setObject: (event)->
    @model.set(event.target.name, event.target.value)
  
  submit: (event)->
    event.preventDefault()
    console.log @model.isValid()
    # @model.save({}, {
    #   error: @showError
    #   success: @hideModal
    # })
  
  showError: (model, error)->
    console.log(model, error)
  
  hideModal: ->
    @$el.modal('hide')
    
  setUpValidation: ->
    @$('input[name]').each _.bind (i, el)->
      @model.required.push $(el).attr('name')
    , @

  render: ->
    @$el.html Handlebars.templates['home/share_form']()
    @setUpValidation()
    @