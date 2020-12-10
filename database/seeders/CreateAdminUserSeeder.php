<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class CreateAdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'name' => 'Leo Maldonado', 
            'email' => 'lrmaldo@gmail.com',
            'password' => bcrypt('secret')
        ]);
    
        $role = Role::create(['name' => 'Admin']);
        
        $permissions = Permission::pluck('id','id')->all();
        
        $role->syncPermissions($permissions);
        
        $user->assignRole([$role->id]);
        
        $role1 = Role::create(['name' => 'encuestado']);
        $role1->givePermissionTo([
            'encuesta-guardar',
            'encuesta-ver',
        ]);
    }
}
