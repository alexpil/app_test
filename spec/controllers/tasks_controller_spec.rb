
require 'spec_helper'

describe TasksController do

    describe 'GET start' do
        it 'creates new task' do
            get :start, id: 1
            task = Task.find(1)
            expect(task.id).to be 1
            expect(task.start_time).to_not be_nil
        end

        it 'reject task with the same unique id' do
            Task.create(unique_id: 1, start_time: Time.now)
            get :start, id: 1

            tasks = Task.where('unique_id = 1')
            expect(tasks.count).to be 1
        end
    end
end