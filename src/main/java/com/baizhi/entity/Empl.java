package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="empl")
public class Empl implements Serializable {
    @Id
    private Integer id;
    private String name;
    private Integer age;
    private Double salary;
}
