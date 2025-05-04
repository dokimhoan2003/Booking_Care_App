package com.project.requests;

import lombok.*;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor

public class UserLoginRequest {
    @NotBlank(message = "Username can not blank")
    @Size(min = 6, message = "The length of the username must be greater than 6")
    private String username;

    @NotBlank(message = "Password can not blank")
    @Size(min = 6, message = "The length of the password must be greater than 6")
    private String password;
}
