
// Add Course
function AddCourses() {
	var ID = parseInt($('#CourseID').val());
    var Name = $('#CourseName').val();

    var Course = {
		CourseID: ID,
        CourseName: Name
    };
	
//AJAX CPURSE
    $.ajax({
        url: 'https://localhost:44347/api/Course',
        type: 'POST',
        data: JSON.stringify(Course),
        contentType: 'application/json',
        success: function() {
            // Clear form
            $('#CourseForm')[0].reset();
            // Update Student List
            fetchCourses();
        }
    });
}

// Fetch Courses
function fetchCourses() {
    $.ajax({
        url: 'https://localhost:44347/api/Course',
        type: 'GET',
        success: function(data) {
            $('#CourseList').empty();
            data.forEach(function(Course) {
                $('#CourseList').append('<li class="list-group list-group-flush">' + Course.courseID +' ' + Course.courseName + '</li>');
            });
        }
    });
}

// Initial fetch
$(document).ready(function() {
    fetchCourses();
    //fetchCourses();
});











