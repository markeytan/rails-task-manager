class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = Task.all
    end

    def show
        @tasks = Task.find(params[:id])
    end

    def new #for the form
        @task = Task.new
    end

    def create #edit step1
        Task.create(task_params)
        redirect_to tasks_path
    end

    def edit #edit step2
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to tasks_path
    end

    def destroy
        @task.destroy
        redirect_to tasks_path
    end

    private
    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :details, :completed)
    end
end

