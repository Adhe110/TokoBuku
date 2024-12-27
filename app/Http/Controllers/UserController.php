<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {

        $search = request('search');

        $users = User::when($search, function ($query, $search) {
            return $query->where('name', 'like', "%{$search}%")
                        ->orWhere('email', 'like', "%{$search}%");
                     })->latest()->paginate(10);

        // Mengirim data ke view
        return view('Users.index', compact('users'));
    }

    // Menampilkan form login
    public function showLoginForm()
    {
        return view('LoginUser.login');
    }

    // Menangani proses login
    public function login(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (Auth::attempt(['email' => $validated['email'], 'password' => $validated['password']])) {
            return redirect()->intended('/dashboard');
        }

        return back()->withErrors(['email' => 'Email atau password salah.']);
    }

    // Menampilkan form register
    public function showRegisterForm()
    {
        return view('LoginUser.register');
    }

    // Menangani proses register
    public function register(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
        ]);
    
        $user = new User();
        $user->name = $validated['name'];
        $user->email = $validated['email'];
        $user->password = Hash::make($validated['password']);
        $user->save();
    
        // Setelah register, arahkan ke halaman login
        return redirect()->route('login')->with('success', 'Akun berhasil dibuat. Silakan login.');
    }
    

    // Logout
    public function logout()
    {
        Auth::logout();
        return redirect()->route('login');
    }
    
}


