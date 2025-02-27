import React from 'react';
import { AppBar, Toolbar, IconButton, Typography, Button, Box, Container } from '@mui/material';
import { Home, Add, Person } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';

interface MainLayoutProps {
  children: React.ReactNode;
}

export default function MainLayout({ children }: MainLayoutProps) {
  const navigate = useNavigate();

  return (
    <Box sx={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}>
      <AppBar position="fixed" color="default" elevation={1}>
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate('/')}>
            <Home />
          </IconButton>
          <Typography variant="h6" component="div" sx={{ flexGrow: 1, color: 'primary.main', fontWeight: 'bold' }}>
            PinClone
          </Typography>
          <Button
            color="inherit"
            startIcon={<Add />}
            onClick={() => navigate('/pin/create')}
            sx={{ mx: 1 }}
          >
            Create
          </Button>
          <IconButton color="inherit" onClick={() => navigate('/profile/me')}>
            <Person />
          </IconButton>
        </Toolbar>
      </AppBar>
      <Toolbar /> {/* Spacer */}
      <Container maxWidth="xl" sx={{ flexGrow: 1, py: 3 }}>
        {children}
      </Container>
    </Box>
  );
} 