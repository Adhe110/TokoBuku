<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        // Cek apakah admin sudah login
        if (!Auth::guard('admin')->check()) {
            // Jika belum login, alihkan ke halaman login
            return redirect()->route('admin.login');
        }

        // Lanjutkan request jika sudah login
        return $next($request);
    }
}
