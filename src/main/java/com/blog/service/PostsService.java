package com.blog.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.blog.bean.Posts;

/*
 * It is just a helper class which should be replaced by database implementation.
 * It is not very well written class, it is just used for demonstration.
 */
public class PostsService {

	static HashMap<Integer,Posts> postIdMap=getPostIdMap();


	public PostsService() {
		super();

		if(postIdMap==null)
		{
			postIdMap=new HashMap<Integer,Posts>();
		// Creating some object of posts while initializing
			Posts javaPost = new Posts(1, "Java Platforms","aaaaaaadsfzddv");
			Posts angularPost = new Posts(2, "Angular7 UI Development","cgvfgvsfvsfdv");
			Posts phythonPost = new Posts(3, "Phython-Emerging Technology","sdgfsfgvdfgbdbhdg");
			Posts AiMlPost = new Posts(4, "AI/ML Scopes","sfgfvgfdvfsvfdv");
			Posts cloudPost = new Posts(5, "Cloud Computing","Microsoft Azure, Amazon web services and IBM cloud");
			


			postIdMap.put(1,javaPost);
			postIdMap.put(2,angularPost);
			postIdMap.put(3,phythonPost);
			postIdMap.put(4,AiMlPost);
			postIdMap.put(5,cloudPost);
			
		}
	}

	public List<Posts> getAllPosts()
	{
		List<Posts> posts = new ArrayList<Posts>(postIdMap.values());
		return posts;
	}

	public Posts getPostById(int postId)
	{
		Posts posts= postIdMap.get(postId);
		return posts;
	}
	
	public Posts addPosts(Posts posts)
	{
		//posts.setId(postIdMap.size()+1);
		postIdMap.put(posts.getId(), posts);
		System.out.println("posts added -->"+posts.toString());
		return posts;
	}
	
	public Posts updatePosts(Posts posts)
	{
		if(posts.getId() <= 0)
			return null;
		
		postIdMap.put(posts.getId(), posts);
		return posts;
	}
	
	public void deletePost(int id)
	{
		postIdMap.remove(id);
	}

	public static HashMap<Integer, Posts> getPostIdMap() {
		return postIdMap;
	}


}
