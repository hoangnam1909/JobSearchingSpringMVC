package com.nhn.controllers;

import com.nhn.pojo.Comment;
import com.nhn.pojo.User;
import com.nhn.service.CommentService;
import com.nhn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class ApiCommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping(value = "/api/add-comment", produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params) {
        try {
            String content = params.get("content");
            int employerId = Integer.parseInt(params.get("employerId"));
            int userId = Integer.parseInt(params.get("userId"));

            Comment comment = this.commentService.addComment(content, employerId, userId);

            return new ResponseEntity<>(comment, HttpStatus.CREATED);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

}
