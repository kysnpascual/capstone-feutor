<?php
include('connection/dbconfig.php');

// Handle tutor approval and subject assignment
if (isset($_POST['approve_btn'])) {
    if (isset($_POST['tutorID'])) {
        $tutorID = $_POST['tutorID'];
        $subjectID = $_POST['subjectID']; // Get the selected subject ID

        if ($subjectID == "") {
            $_SESSION['message'] = "Please select a subject before approving the tutor.";
        } else {
            // Update approval status to "Approved" and assign the subject
            $update_query = "UPDATE tutor SET approvalStatus='Approved', assignedSubject='$subjectID' WHERE tutorID='$tutorID'";
            $update_result = mysqli_query($conn, $update_query);

            if ($update_result) {
                $_SESSION['message'] = "Tutor approved and subject assigned successfully.";
            } else {
                $_SESSION['message'] = "Failed to approve tutor or assign subject.";
            }
        }
    }
}

if (isset($_POST['decline_btn'])) {
    if (isset($_POST['tutorID'])) {
        $tutorID = $_POST['tutorID'];

        // Update approval status to "Declined" without requiring subject assignment
        $update_query = "UPDATE tutor SET approvalStatus='Declined' WHERE tutorID='$tutorID'";
        $update_result = mysqli_query($conn, $update_query);

        if ($update_result) {
            $_SESSION['message'] = "Tutor declined successfully.";
        } else {
            $_SESSION['message'] = "Failed to decline tutor.";
        }
    }
}

// Fetch subjects for dropdown
$subject_query = "SELECT * FROM subjects";
$subject_result = mysqli_query($conn, $subject_query);

// Retrieve pending student tutors from the database
$query = "SELECT * FROM tutor WHERE approvalStatus = 'Pending'";
$result = mysqli_query($conn, $query);

// Check if there are any pending tutors
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        ?>
        <tr>
            <td><?php echo $row['tutorID']; ?></td>
            <td><?php echo $row['firstName']; ?></td>
            <td><?php echo $row['lastName']; ?></td>
            <td><?php echo $row['email']; ?></td>
            <td><?php echo $row['degreeProgram']; ?></td>
            <td><?php echo $row['year']; ?></td>
            <td><a href="<?php echo $row['gdriveLink']; ?>" target="_blank">Drive Link</a></td>
            <td>
                <!-- Dropdown for subject selection -->
                <form method="POST" style="display: inline;" onsubmit="return validateForm(this);">
                    <input type="hidden" name="tutorID" value="<?php echo $row['tutorID']; ?>">
                    <select name="subjectID">
                        <option value="">Select Subject</option>
                        <?php
                        mysqli_data_seek($subject_result, 0); // Reset the pointer

                        while ($subject = mysqli_fetch_assoc($subject_result)) {
                            echo '<option value="' . $subject['id'] . '">' . $subject['subject_name'] . '</option>';
                        }
                        ?>
                    </select>
            </td>
            <td>
                <!-- Action buttons -->
                    <button type="submit" class="btn btn-success" name="approve_btn">APPROVE</button>
                    <button type="submit" class="btn btn-danger" name="decline_btn">DECLINE</button>
                </form>
            </td>
        </tr>
        <?php
    }
} else {
    echo "<tr><td colspan='9'>No pending tutors</td></tr>";
}

// Close the database connection
mysqli_close($conn);
?>

<script>
function validateForm(form) {
    const approveButton = form.querySelector('[name="approve_btn"]');
    const subjectSelect = form.subjectID;

    // Check if the approve button is clicked
    if (approveButton && subjectSelect.value === "") {
        alert("Please select a subject before approving the tutor.");
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}
</script>
