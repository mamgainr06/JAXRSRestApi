<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog Posts</title>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 10px;
}
th {
  background-color: #4CAF50;
  color: white;
}
tr:hover {background-color:#f5f5f5;}

.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
var flag = true;
$(document).ready( 
		  $.getJSON("http://localhost:8080/JAXRSJsonCRUDExample/blog-web/posts/",{}, showPosts)
	  );
	  
	  function getPost(){
		  $.getJSON("http://localhost:8080/JAXRSJsonCRUDExample/blog-web/posts/",{}, showPosts);
	  }

	  function showPosts(posts) {
		  var txt = "<table><tr><th>ID</th><th>Title</th><th>Content</th></tr>"
	     $.each(posts, 
	    	 function(idx,post) 
	    	 {
	    	    txt += "<tr><td>" + post.id + " </td><td> " + post.title + " </td><td> " +  post.content + "</td><tr>";
	         }
	     );
		  txt += "</table>";
		  document.getElementById("posts").innerHTML = txt;
	  }

	  function validate(){
		  var txt = "";
		  if($("#postid").val() == ""){
			  txt = " Post Id,";
			  flag = false;
		  }
		  
		  if($("#title").val() == ""){
			  txt += " Title,";
			  flag = false;
		  }
		  
		  if($("#content").val() == ""){
			  txt += " Content";
			  flag = false;
		  }
		  
		  if(txt.length > 0)
		  	alert("Please enter"+ txt +" !!!!");
		  else
			  flag = true;
	  }
	  
	  function updatePost() {
		 validate();
		  if(flag){
			  var post = '{ "id": "'+$("#postid").val()+'", "title" :"'+ $("#title").val() +'", "content": "'+ $("#content").val()+ '"}'; 
			  $.ajax( 
				    	 {
					       url : "http://localhost:8080/JAXRSJsonCRUDExample/blog-web/posts/" ,
			      	       data : post,
			      	       datatype : "json",
					       method : "PUT",
					       contentType: 'application/json;charset=utf-8',
					       complete : showUpdateResult
				    	 }
				      ); 
			}
		}
	  
	  function showUpdateResult(result) {
			 if (result.status == 200){	
			    alert("Updated Successfully");
				 getPost();
	  		}else
			    alert("Sorry! Could not update post!");
	  }
	  
	  function getPostById(){
		  if($("#postid").val() != "" && $("#postid").val().length > 0){
			  $.ajax( 
				    	 {
					       url : "http://localhost:8080/JAXRSJsonCRUDExample/blog-web/posts/" + $("#postid").val(),
					       method : "GET",
					       contentType: 'application/json;charset=utf-8',
					       complete : showGetResult
				    	 }
				      );
		  }else{
			  alert("Please enter Post Id to be search !!");
		  }
		   
		}
	  
	  function showGetResult(result) {
			 if (result.status == 200){
				var res = JSON.parse(result.responseText);
			    $("#postid").val(res.id);
			    $("#title").val(res.title);
			    $("#content").val(res.content);
	  		}else
			    alert("Sorry! Could not find the post!");
	  }

	  function deletePost() {
		  if($("#postid").val() != "" && $("#postid").val().length > 0){	
		     $.ajax( 
		    	 {
			       url : "http://localhost:8080/JAXRSJsonCRUDExample/blog-web/posts/" + $("#postid").val(),
	   	  	       method : "delete",
	   	  	  	   contentType: 'application/json',
			       complete : showDeleteResult
		    	 }
		      );
		  }else{
			  alert("Please enter Post Id to be search !!");
		  }
	  }
		  
	  function showDeleteResult(result) {
			 if (result.status != 404){
				 alert("Deleted Successfully");
				 clearText();
				 getPost();
			 } else
			    alert("Sorry! Could not delete book!");
	  }
		
	  function addPost() {
		validate();
		if(flag){
		  var post = '{ "id": "'+$("#postid").val()+'", "title" :"'+ $("#title").val() +'", "content": "'+ $("#content").val()+ '"}';

		     $.ajax( 
		    	 {
			       url : "http://localhost:8080/JAXRSJsonCRUDExample/blog-web/posts/",
			       dataType: "json",
	      	       data : post,
			       method : "POST",
			       contentType: 'application/json;charset=utf-8',
			       complete : showAddResult
		    	 }
		      );
		}
	  }
	    	  
	  function showAddResult(result) {
			 alert("Added Successfully");
			 getPost();
			 clearText();
	  }
	  
	  function clearText(){
		  $("#postid").val('');
		  $("#title").val('');
		  $("#content").val('');
	  }
		  
	</script>
	</head>
<body>
<h1 style="text-align:center;"> <b>Blog Posts</b></h1>

	<h2>Posts: </h2>
	<div id="posts">
	</div>
	<br />
	<br />
	<hr />
	<h2> Blog Details Form : </h2>
	Post Id : <input type="text" id="postid" /> 
	<p />
	Title 	: <input type="text" id="title" /> 
	<p />
	Content : <input type="text" id="content" /> 
	<p />
	<button class="button" onclick="addPost()"> ADD </button><button class="button" onclick="updatePost()"> UPDATE </button><button class="button" onclick="getPostById()"> FIND POST </button> <button class="button" onclick="deletePost()"> DELETE </button>
</body>
</html>
