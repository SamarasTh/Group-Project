/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.DoggyWalker.service;

import com.example.DoggyWalker.model.Role;
import java.util.List;

/**
 *
 * @author RG
 */
public interface RoleServiceInterface {
    
    public Role getRoleByID(int id);
    public List<Role> getAllRoles();
}
