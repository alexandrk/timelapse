class TL.Views.Main extends Backbone.View
	
	initialize: ->
		_.bindAll(@)
		#@collection = new TL.Collections.VideoObjects()
		#@collection.on 'reset', @render, @
		#@collection.on 'add', @addOne, @
		#@collection.fetch()
		@render()
	kill: ->
		@unbind()
		@remove()
	events:
		'click .share': 'share'
		'click .accountForm' : 'signup'
		
	initModals: ->
		shareForm = new TL.Views.Modals.Share()
		@$share = $ shareForm.el
		@$('.modals').append @$share

		signupForm = new TL.Views.Modals.SignUp()
		@$signup = $ signupForm.el
		@$('.modals').append @$signup
		
	render: ->
		# ($ "#popular ul").html HandlebarsTemplates['home/thumbnails']({videos:@collection})
		@thumbnails = new TL.Views.VideoThumbnails
			el: '#popular'		
		@initModals()
		@

	signup: (event)->
		event.preventDefault()
		@$signup.modal('show')

	share: (event)->
		event.preventDefault()
		@$share.modal('show')
		#open share view

	#addOne: ->
		#put marker on map
		#marker:
			#marker with coordinates retreived from address
			#generate event on marker click: Go to singe video page
			
			