package com.project.requests;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TimeRequest {
    @NotNull(message = "Doctor can not be blank")
    private Long doctorId;
    @NotBlank(message = "Date booking can not be blank")
    private String date;
}
