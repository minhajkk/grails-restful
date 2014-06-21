package com.scrum

import com.scrum.auth.User
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

/**
 * Comment is the class to represent the 'comment' table in database.
 * <p>Comment class holds all the comments made against {@code Project} </p>
 *
 * @author Minhaj
 * @see Project
 */
@ToString(includeNames = true, includeFields = true, excludes = 'dateCreated,lastUpdated,metaClass')
@EqualsAndHashCode
class Comment {
    /* Default (injected) attributes of GORM */
    Long    id
    Long    version

    /* Comment fields */
    String  description
    User    user
    Task    task

    /* Relations of domain */
    static belongsTo = [task:Task]

    /* Automatic timestamping of GORM */
    Date    dateCreated
    Date    lastUpdated

    /* Constraints */
    static constraints = {
        description blank:false
        user blank:false
    }
}
