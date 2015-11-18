class PostsController < ApplicationController
  def index
  	@posts = Post.all

  	primo = Post.first
  	primo.title = "SPAM"
  	primo.save!

  	start = 6
  	@posts.each do |post|
  		if post.id == start
  			post.title = "SPAM"
  			start += 5
  		end
  	end

  end

  def show
  end

  def new
  end

  def edit
  end

end
