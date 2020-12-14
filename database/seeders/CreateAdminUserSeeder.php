<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use \App\Models\Tipo_encuesta;
use App\Models\Tipo_pregunta;

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

        $tipo_encuesta  = new Tipo_encuesta();
        $tipo_encuesta->nombre = 'Egresados';
        $tipo_encuesta->save();

        $tipo_encuesta  = new Tipo_encuesta();
        $tipo_encuesta->nombre = 'Empleadores';
        $tipo_encuesta->save();


        $tipo_pregunta = new Tipo_pregunta();
        $tipo_pregunta->nombre ='Texto';
        $tipo_pregunta->save();

        $tipo_pregunta = new Tipo_pregunta();
        $tipo_pregunta->nombre ='Opción';
        $tipo_pregunta->save();
        $tipo_pregunta = new Tipo_pregunta();
        $tipo_pregunta->nombre ='Opción Múltiple';
        $tipo_pregunta->save();

    }
}
