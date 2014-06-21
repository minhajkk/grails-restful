package com.scrum

import com.scrum.auth.User
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString


/**
 * Task is the class to represent the 'task' table in database.
 * <p>Task class holds all the tasks created against any {@code Project} </p>
 *
 * @author Minhaj
 */
@ToString(includeNames = true, includeFields = true, excludes = 'dateCreated,lastUpdated,metaClass')
@EqualsAndHashCode
class Task {

    /* Default (injected) attributes of GORM */
    Long            id
    Long            version

    /* Automatic timestamping of GORM */
    Date            dateCreated
    Date            lastUpdated

    /* Project fields */
    String          title
    String          description
    PriorityEnum    priority
    StatusEnum      status
    User            assignedTo
    User            reportedBy
    Project         project

    static belongsTo = [project:Project]
    static hasMany = [comments: Comment]

    static constraints = {
        title blank: false
        description blank: false
        priority blank: false
        status blank: false
        assignedTo nullable: false
        reportedBy nullable: false
    }
}
