Class {
	#name : #TDExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-TodosAPI-Examples'
}

{ #category : #accessing }
TDExamples >> requestAllPosts [
	<gtExample>
	| postsList |
	postsList := TDClient new
		getAllPosts.
	
	self assert: postsList isNotNil.
	self assert: postsList posts size equals: 100.
	
	^ postsList.
]

{ #category : #accessing }
TDExamples >> requestAllTodos [
	<gtExample>
	| todosList |
	todosList := TDClient new
		getAllTodos.
	
	self assert: todosList isNotNil.
	self assert: todosList todos size equals: 200.
	
	^ todosList.
]

{ #category : #accessing }
TDExamples >> requestAllTodosRawExample [
	<gtExample>
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
	| user |
	user := TDClient new
		getUserWithId: 4.
	
	self assert: user isNotNil.
	self assert: user id equals: 4.
	
	^ user.
]
