{% assign data = include.data %}
<table class="asst-table">
{% for exam in data.exams %}
<tr>
  <td>
      <table class="inner">
        <tr>
            <td>{{ exam.name }} &nbsp; &nbsp; {{ exam.date }}</td>
        </tr>
        {% if exam.info %}
        <tr>
            <td>{{ exam.info }}</td>
        </tr>
        {% endif %}
        {% if exam.reviewguide %}
        <tr>
            <td><a href="{{ data.home }}/{{ exam.reviewguide }}">review guide</a></td>
        </tr>
        {% endif %}
        {% if exam.doc %}
        <tr>
            <td><a href="{{ data.home }}/{{ exam.doc }}">exam document</a></td>
        </tr>
        {% endif %}
        {% if exam.rubric %}
        <tr>
            <td><a href="{{ data.home }}/{{ exam.rubric }}">rubric</a></td>
        </tr>
        {% endif %}
      </table>
  </td>
  <td>
      <table class="inner">
        {% if exam.blank %}
        <tr>
            <td><a href="{{ data.home }}/{{ exam.blank }}">blank</a></td>
        </tr>
        {% endif %}
        {% if exam.solutions %}
        <tr>
            <td><a href="{{ data.home }}/{{ exam.solutions }}">solutions</a></td>
        </tr>
        {% endif %}
      </table>
      <div style="padding-bottom: 10px"></div>
  </td>
</tr>
{% endfor %}
</table>
