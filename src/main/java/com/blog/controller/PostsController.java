package com.blog.controller;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.blog.bean.Posts;
import com.blog.service.PostsService;


@Path("/posts")
public class PostsController {
	
	PostsService postService = new PostsService();
	
    @GET
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
	public List<Posts> getposts()
	{
		
		List<Posts> postsList = postService.getAllPosts();
		return postsList;
	}

    @GET
    @Path("/{postId}")
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
	public Posts getPostById(@PathParam("postId") int postId)
	{
		return postService.getPostById(postId);
	}
   
    @POST
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
	public Posts addPosts(Posts posts)
	{
		return postService.addPosts(posts);
	}

    @PUT
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
	public Posts updatePosts(Posts posts)
	{
		return postService.updatePosts(posts);
		
	}
	
    @DELETE
    @Path("/{postId}")
    @Produces(MediaType.APPLICATION_JSON)
	public void deletePost(@PathParam("postId") int id)
	{
		 postService.deletePost(id);
		
	}
	
}
