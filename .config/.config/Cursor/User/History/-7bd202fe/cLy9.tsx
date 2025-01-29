import React, { useState } from 'react';
import MainLayout from '../components/layout/MainLayout';
import {
  Box,
  Card,
  TextField,
  Button,
  Typography,
  IconButton,
  Paper
} from '@mui/material';
import { CloudUpload, Close } from '@mui/icons-material';

export default function CreatePin() {
  const [image, setImage] = useState<File | null>(null);
  const [preview, setPreview] = useState<string>('');
  const [formData, setFormData] = useState({
    title: '',
    description: '',
  });

  const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      const file = e.target.files[0];
      setImage(file);
      setPreview(URL.createObjectURL(file));
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    // TODO: Implement actual pin creation logic
    console.log('Creating pin with:', { ...formData, image });
  };

  const removeImage = () => {
    setImage(null);
    setPreview('');
  };

  return (
    <MainLayout>
      <Box sx={{ maxWidth: 600, mx: 'auto', mt: 4, p: 2 }}>
        <Typography variant="h4" gutterBottom>
          Create a Pin
        </Typography>

        <Card sx={{ p: 3 }}>
          <form onSubmit={handleSubmit}>
            <Box sx={{ mb: 3 }}>
              {!image ? (
                <Paper
                  variant="outlined"
                  sx={{
                    height: 300,
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                    justifyContent: 'center',
                    cursor: 'pointer',
                    position: 'relative',
                    '&:hover': {
                      bgcolor: 'action.hover'
                    }
                  }}
                  component="label"
                >
                  <input
                    type="file"
                    hidden
                    accept="image/*"
                    onChange={handleImageChange}
                  />
                  <CloudUpload sx={{ fontSize: 48, color: 'text.secondary', mb: 2 }} />
                  <Typography color="text.secondary">
                    Click to upload an image
                  </Typography>
                </Paper>
              ) : (
                <Box sx={{ position: 'relative' }}>
                  <img
                    src={preview}
                    alt="Preview"
                    style={{
                      width: '100%',
                      maxHeight: 500,
                      objectFit: 'contain'
                    }}
                  />
                  <IconButton
                    sx={{
                      position: 'absolute',
                      top: 8,
                      right: 8,
                      bgcolor: 'background.paper'
                    }}
                    onClick={removeImage}
                  >
                    <Close />
                  </IconButton>
                </Box>
              )}
            </Box>

            <TextField
              fullWidth
              label="Title"
              name="title"
              value={formData.title}
              onChange={handleChange}
              margin="normal"
              required
            />

            <TextField
              fullWidth
              label="Description"
              name="description"
              value={formData.description}
              onChange={handleChange}
              margin="normal"
              multiline
              rows={4}
            />

            <Button
              fullWidth
              variant="contained"
              color="primary"
              size="large"
              type="submit"
              sx={{ mt: 3 }}
              disabled={!image}
            >
              Create Pin
            </Button>
          </form>
        </Card>
      </Box>
    </MainLayout>
  );
} 