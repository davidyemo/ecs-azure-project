import uuid
from flask import Flask, request, jsonify, abort, render_template
 
app = Flask(__name__, template_folder='templates', static_folder='static')
 
# In-memory storage for tasks
tasks = {}
 
@app.route('/')
def index():
    return render_template('index.html')
 
@app.route('/tasks', methods=['GET'])
def get_tasks():
    return jsonify(list(tasks.values()))
 
@app.route('/tasks', methods=['POST'])
def create_task():
    data = request.get_json()
    if not data or 'title' not in data:
        abort(400, description="Missing task title")
    task_id = str(uuid.uuid4())
    task = {
        'id': task_id,
        'title': data['title'],
        'description': data.get('description', ''),
        'completed': False,
        'priority': data.get('priority', 'medium'),
        'category': data.get('category', ''),
        'dueDate': data.get('dueDate', '')
    }
    tasks[task_id] = task
    return jsonify(task), 201
 
@app.route('/tasks/<task_id>', methods=['GET'])
def get_task(task_id):
    task = tasks.get(task_id)
    if not task:
        abort(404, description="Task not found")
    return jsonify(task)
 
@app.route('/tasks/<task_id>', methods=['PUT'])
def update_task(task_id):
    if task_id not in tasks:
        abort(404, description="Task not found")
    data = request.get_json()
    task = tasks[task_id]
    task['title'] = data.get('title', task['title'])
    task['description'] = data.get('description', task['description'])
    task['completed'] = data.get('completed', task['completed'])
    task['priority'] = data.get('priority', task.get('priority', 'medium'))
    task['category'] = data.get('category', task.get('category', ''))
    task['dueDate'] = data.get('dueDate', task.get('dueDate', ''))
    tasks[task_id] = task
    return jsonify(task)
 
@app.route('/tasks/<task_id>', methods=['DELETE'])
def delete_task(task_id):
    if task_id not in tasks:
        abort(404, description="Task not found")
    del tasks[task_id]
    return jsonify({'result': True})
 
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000, debug=True)
 