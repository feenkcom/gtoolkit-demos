Class {
	#name : #TDExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-TodosAPI-Examples'
}

{ #category : #accessing }
TDExamples >> requestAllPosts [
	<gtExample>
	<noTest>
	| postsGroup |
	postsGroup := TDClient new
		getAllPosts.
	
	self assert: postsGroup isNotNil.
	self assert: postsGroup posts size equals: 100.
	
	^ postsGroup.
]

{ #category : #accessing }
TDExamples >> requestAllTodos [
	<gtExample>
	<noTest>
	| todosGroup |
	todosGroup := TDClient new
		getAllTodos.
	
	self assert: todosGroup isNotNil.
	self assert: todosGroup todos size equals: 200.
	
	^ todosGroup.
]

{ #category : #accessing }
TDExamples >> requestAllTodosRawExample [
	<gtExample>
	<noTest>
	| response |
	response := ZnClient new
		url: 'https://jsonplaceholder.typicode.com/todos';
		get;
		response.
	
	self assert: response isNotNil.
	self assert: response status equals: 200.
	
	^ response.
]

{ #category : #accessing }
TDExamples >> requestCommentWithIdFive [
	<gtExample>
	<noTest>
	| comment |
	comment := TDClient new
		getCommentWithId: 5.
	
	self assert: comment isNotNil.
	self assert: comment id equals: 5.
	self assert: comment postId equals: 1.
	
	^ comment.
]

{ #category : #accessing }
TDExamples >> requestPostWithIdThree [
	<gtExample>
	<noTest>
	| post |
	post := TDClient new
		getPostWithId: 3.
	
	self assert: post isNotNil.
	self assert: post id equals: 3.
	self assert: post userId equals: 1.
	
	^ post.
]

{ #category : #accessing }
TDExamples >> requestPostsForUserWithIdFourRawExample [
	<gtExample>
	<noTest>
	| response |
	response := ZnClient new
		url: 'https://jsonplaceholder.typicode.com/posts?userId=4';
		get;
		response.
	
	self assert: response isNotNil.
	self assert: response status equals: 200.
	
	^ response.
]

{ #category : #accessing }
TDExamples >> requestTodoWithIdEight [
	<gtExample>
	<noTest>
	| todo |
	todo := TDClient new
		getTodoWithId: 8.
	
	self assert: todo user isNotNil.
	self assert: todo id equals: 8.
	
	^ todo.
]

{ #category : #accessing }
TDExamples >> requestTodoWithIdEightRawExample [
	<gtExample>
	<noTest>
	| response |
	response := ZnClient new
		url: 'https://jsonplaceholder.typicode.com/todos/8';
		get;
		response.
	
	self assert: response isNotNil.
	self assert: response status equals: 200.
	
	^ response.
]

{ #category : #accessing }
TDExamples >> requestUserWithIdFour [
	<gtExample>
	<noTest>
	| user |
	user := TDClient new
		getUserWithId: 4.
	
	self assert: user isNotNil.
	self assert: user id equals: 4.
	
	^ user.
]
