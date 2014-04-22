class TasksController < ApplicationController


    def start

        Task.create(unique_id: params[:id], start_time: Time.now)
        render text: 'started!!!'
    end

    def stop

        task = Task.find_by( unique_id: params[:id])
        if task
            task.stop_time = Time.now
            task.save
        end
        render text: 'stopped !!'
    end

    def error_check

        all_tasks = Task.where("start_time <= ?", 1.minutes.ago)
        all_tasks_not_stopped = Task.where("start_time <= ? AND stop_time IS NULL", 1.minutes.ago)
        if all_tasks_not_stopped.count > 0
            precentage = (all_tasks_not_stopped.count * 100) / all_tasks.count
            if precentage >= 50
              render text: "#{precentage} precent of the jobs havent stopped"
              return
            end
        end

        render text: "All tasks finished!"

    end
end