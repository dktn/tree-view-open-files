{requirePackages} = require 'atom-utils'
TreeViewOpenFilesView = require './tree-view-open-files-view'

module.exports =
	treeViewOpenFilesView: null

	config:
		maxHeight:
			type: 'integer'
			default: 1000
			min: 0
			description: 'Maximum height of the list before scrolling is required. Set to 0 to disable scrolling.'

	activate: (state) ->
		requirePackages('tree-view').then ([treeView]) =>
			@treeViewOpenFilesView = new TreeViewOpenFilesView

			# if treeView.treeView
			# 	@treeViewOpenFilesView.show()

			atom.commands.add 'atom-workspace', 'tree-view-open-files:show', =>
				@treeViewOpenFilesView.show()

			atom.commands.add 'atom-workspace', 'tree-view-open-files:hide', =>
				@treeViewOpenFilesView.hide()

			atom.commands.add 'atom-workspace', 'tree-view-open-files:toggle', =>
				@treeViewOpenFilesView.toggle()

	deactivate: ->
		@treeViewOpenFilesView.destroy()

	serialize: ->
		# TreeViewOpenFilesViewState: @TreeViewOpenFilesView.serialize()
