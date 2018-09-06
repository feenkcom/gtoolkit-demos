actions
performActions: loadActions
	loaderProcess ifNotNil: [ ^ self ].
	loaderProcess := [ 
		loadActions do: [ :anAction |
			dataSource perform: anAction with: self.
			BlUniverse default defer: [
				dataSource notifyItemsChanged: (index to: index) ]].
		BlUniverse default defer: [
			loaderProcess := nil ]
	] fork