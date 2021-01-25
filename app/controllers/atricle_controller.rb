class ArticleController < ApplicationController

    get '/articles' do
        @articles = Article.all
        erb :index    
    end

    get '/articles/new' do
        erb :new
    end

    get '/articles/:id' do
        @article = Article.find(params[:id])
        erb :show
    end

    get '/articles/:id/edit' do
        @article = Article.find(params[:id])
        erb :edit
    end
    
    post '/articles' do
        @article = Article.create(params)
        redirect "/articles/#{@article.id}"
    end

    patch '/articles/:id' do
        @article = Article.find(params[:id])
        @article.update(title: params[:title], content: params[:content])
        redirect "/articles/#{@article.id}"
    end

    delete '/articles/:id' do
        @article = Article.find(params[:id])
        @article.destroy
        redirect "/articles"
    end
end