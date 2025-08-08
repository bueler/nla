{% assign data = include.data %}

<ul>
{% for material in data.daily %}
<li style=" margin-bottom: 10px;">
    {{ material.name }}: <br>
    {{ material.covered }}
    {% if material.lecture %}
        (<b>Lecture {{ material.lecture }}</b> in T&B)
    {% endif %}
    {% if material.due %}
        <br><b>due: {{ material.due }}</b>
    {% endif %}
    {% if material.more %}
        <br>{{ material.more }}
    {% endif %}
    {% if material.worksheet %}
        <br>worksheet: <a href="{{ data.home }}/{{ material.worksheet }}">{{ material.worksheetname }} (PDF)</a>
    {% endif %}
    {% if material.handout %}
        <br>handout: <a href="{{ data.home }}/{{ material.handout }}">{{ material.handoutname }} (PDF)</a>
    {% endif %}
    {% if material.otherurl %}
        <br><a href="{{ material.otherurl }}">{{ material.otherurlname }}</a>
    {% endif %}
</li>
{% endfor %}
</ul>
