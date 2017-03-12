require 'securerandom'
class Admin::HooksController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :redirect

  def index
    @hooks = Admin::Hook.all
  end

  def create
    hook = Admin::Hook.create(
      #id: SecureRandom.uuid,
      name: params[:name],
      target: params[:target],
      description: params[:description]
    )
    redirect_to hook
  end

  def show
    @hook = Admin::Hook.find(params[:id])
  end

  def destroy
    hook = Admin::Hook.find(params[:id])
    if hook.nil?
      render :json => {:error => 'Hook not found', }.to_json, :status => 404
    else
      hook.destroy
      redirect_to admin_hooks_url
    end
  end

  def new
  end

  def edit
    @hook = Admin::Hook.find(params[:id])
    if @hook.nil?
      render 'hook_not_found', :status => 404
    end
  end

  def update
    hook = Admin::Hook.find(params[:id])
    if hook.nil?
      render 'hook_not_found', :status => 404
    else
      # update stuff
    end
  end

  def redirect
    @hook = Admin::Hook.find(params[:id])
    if @hook.nil?
      render :json => {:error => 'Hook not found'}.to_json, :status => 404
    else
      target = @hook.target
    end
  end
end
