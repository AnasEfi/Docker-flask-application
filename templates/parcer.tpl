{% extends "body.tpl" %}

{% block content %}

    <h1>Web Content Viewer</h1>
    
    <form action = '/' method = POST>
        <label for="url">Enter website URL:</label>
        <input type="url" name="url" required>
        <button type="submit">Fetch Content</button>
    </form>

    {% if text_content %}
        <h2>Text Content:</h2>
        <pre>{{ text_content }}</pre>
    {% endif %}

    {% if error_message %}
        <p style="color: red;">{{ error_message }}</p>
    {% endif %}

{% endblock %}
