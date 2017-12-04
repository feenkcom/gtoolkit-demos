demos
uiModel
	"Interaction between model and UI of the editor"

	^ self stepping: {
		'container := GtDemoEditorScg cointainer.
view := GtDemoEditorScg view.
view contentElement: container.

model := GtDemoEditorScg model.
ui := GtDemoEditorScg ui.
container addChildren: { model . ui }.
view.'.
	'
GtDemoEditorScg link: ui to: model.
view.'.

	'
GtDemoEditorScg requestFrom: ui to: model in: container.
view.'.
	'
GtDemoEditorScg announceFrom: model to: ui in: container.
view'

	}